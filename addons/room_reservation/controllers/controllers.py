# -*- coding: utf-8 -*-
from odoo.http import Controller, Response, request, route
import json
import re

class RoomReservationController(Controller):
    def _validate_reservation_number(self, number):
        # Note that pattern below should be adjusted if sequence pattern is changed
        pattern = re.compile('^(SM|LM|H)-[0-9]{4}-[0-9]{8}$')
        return pattern.match(number)

    def _get_response(self, content, status_code):
        return Response(
            json.dumps(content),
            status=status_code,
            mimetype='application/json',
        )

    @route('/api/room-reservation/<string:number>', type='http', auth='user', methods=['GET'])
    def get_room_reservation_by_number(self, number, **kwargs):
        if not self._validate_reservation_number(number):
            return self._get_response({'message': 'Invalid pattern for room reservation number.'}, 400)

        room_reservation = request.env['room.reservation'].search([('number', '=', number)])
        if room_reservation:
            return self._get_response({'state': room_reservation.state}, 200)
        else:
            return self._get_response({'message': 'Cannot find room reservation with given number.'}, 404)

    # or remove function above and uncomment function below if you want the API to be publicly accessible
    # @route('/api/room-reservation/<string:number>', type='http', auth='public', methods=['GET'])
    # def get_room_reservation_by_number(self, number, **kwargs):
    #     if not self._validate_reservation_number(number):
    #         return self._get_response({'message': 'Invalid pattern for room reservation number.'}, 400)

    #     room_reservation = request.env['room.reservation'].sudo().search([('number', '=', number)])
    #     if room_reservation:
    #         return self._get_response({'state': room_reservation.state}, 200)
    #     else:
    #         return self._get_response({'message': 'Cannot find room reservation with given number.'}, 404)
