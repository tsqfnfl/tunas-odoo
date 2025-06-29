# -*- coding: utf-8 -*-
{
    'name': "Room Reservation",

    'summary': """
        Manage rooms and the reservations associated with them
    """,

    'description': """
        - Manage rooms
        - Manage room reservations
    """,

    'author': "Tsaqif Naufal",

    'category': 'Uncategorized',
    'version': '1.0',

    'depends': ['base'],

    'data': [
        'security/ir.model.access.csv',
        'data/room_reservation_sequences.xml',
        'views/room_views.xml',
        'views/room_reservation_views.xml',
    ],

    'demo': [
        'data/room_demo.xml',
        'data/room_reservation_demo.xml',
    ],
}
