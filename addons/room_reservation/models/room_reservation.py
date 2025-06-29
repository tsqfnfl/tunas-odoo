# -*- coding: utf-8 -*-
from odoo import models, fields, api
from odoo.exceptions import ValidationError

class RoomReservation(models.Model):
    _name = 'room.reservation'
    _description = 'Room Reservation (Pemesanan Ruangan)'
    _rec_name = 'number'

    number = fields.Char(string='Nomor Pemesanan', default='New', required=1)
    room_id = fields.Many2one('room.room', string='Ruangan', required=1)
    name = fields.Char(string='Nama Pemesanan', required=1)
    date = fields.Date(string='Tanggal Pemesanan', required=1)
    state = fields.Selection([
        ('draft', 'Draft'),
        ('on_going', 'On Going'),
        ('done', 'Done'),
    ], default='draft', string='Status Pemesanan')
    notes = fields.Text(string='Catatan Pemesanan')

    @api.constrains('name')
    def _validate_name(self):
        name_count = self.search_count([('name', '=', self.name), ('id', '!=', self.id)])
        if name_count > 0:
            raise ValidationError(f'Nama pemesanan {self.name} telah dipakai!')

    @api.constrains('room_id', 'date')
    def _validate_room_date(self):
        room_date_count = self.search_count([('room_id', '=', self.room_id.id), ('date', '=', self.date), ('id', '!=', self.id)])
        if room_date_count > 0:
            raise ValidationError(f'Ruangan {self.room_id.name} telah dipesan untuk tanggal {self.date}!')

    # or remove _validate_name and _validate_room_date functions above and uncomment _sql_constraints below
    # _sql_constraints = [
    #     ('unique_name', 'unique (name)', 'Nama pemesanan tidak boleh sama!'),
    #     ('unique_room_date', 'unique (room_id, date)', 'Tidak dapat memesan ruangan dengan tanggal pemesanan yang sama!'),
    # ]

    def action_process(self):
        if self.state == 'draft':
            self.write({'state': 'on_going'})
        elif self.state == 'on_going':
            self.write({'state': 'done'})

    def _compute_number(self):
        # assume the sequence is not depends on reservation type since it was not described in the instruction file
        room_type = self.room_id.room_type
        if room_type == 'small_meeting':
            sequence = self.env['ir.sequence'].next_by_code('room.reservation.small_meeting')
        elif room_type == 'large_meeting':
            sequence = self.env['ir.sequence'].next_by_code('room.reservation.large_meeting')
        elif room_type == 'hall':
            sequence = self.env['ir.sequence'].next_by_code('room.reservation.hall')
        
        date = fields.Date.from_string(self.date).strftime('%Y%m%d')
        self.write({'number': f'{sequence}-{date}'})
        return self

    # Note: I'm not sure if further input validation is required to prevent SQL injection since database operations
    # in this module are executed using ORM, not the database cursor directly. However, I might have missed cases where even
    # the ORM couldn't handle it properly and would like to learn more about it.
    @api.model
    def create(self, values):
        record = super(RoomReservation, self).create(values)
        record._compute_number()
        return record

    def write(self, values):
        previous_room_type = self.room_id.room_type
        record = super(RoomReservation, self).write(values)
        new_room_type = self.room_id.room_type
        if previous_room_type != new_room_type:
            self._compute_number()
        return record
