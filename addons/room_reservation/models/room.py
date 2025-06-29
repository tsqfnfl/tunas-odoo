# -*- coding: utf-8 -*-
from odoo import models, fields, api
from odoo.exceptions import ValidationError

class Room(models.Model):
    _name = 'room.room'
    _description = 'Room Master (Master Ruangan)'

    name = fields.Char(string='Nama Ruangan', required=1)
    room_type = fields.Selection([
        ('small_meeting', 'Meeting Room Kecil'),
        ('large_meeting', 'Meeting Room Besar'),
        ('hall', 'Aula'),
    ], string='Tipe Ruangan', required=1)
    location = fields.Selection([
        ('1a', '1A'),
        ('1b', '1B'),
        ('1c', '1C'),
        ('2a', '2A'),
        ('2b', '2B'),
        ('2c', '2C'),
    ], string='Lokasi Ruangan', required=1)
    photo = fields.Binary(string='Foto Ruangan', required=1)
    photo_name = fields.Char()
    capacity = fields.Integer(string='Kapasitas Ruangan', required=1)
    notes = fields.Text(string='Keterangan')

    @api.constrains('name')
    def _validate_name(self):
        name_count = self.search_count([('name', '=', self.name), ('id', '!=', self.id)])
        if name_count > 0:
            raise ValidationError(f'Nama ruangan {self.name} telah dipakai!')

    @api.constrains('capacity')
    def _validate_capacity(self):
        if self.capacity <= 0:
            raise ValidationError(f'Kapasitas ruangan harus lebih besar dari 0!')

    # or remove _validate_name and _validate_capacity functions above and uncomment _sql_constraints below
    # _sql_constraints = [
    #     ('unique_name', 'unique (name)', 'Nama ruangan tidak boleh sama!'),
    #     ('positive_capacity', 'check (capacity > 0)', 'Kapasitas ruangan harus lebih besar dari 0!'),
    # ]
