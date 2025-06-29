# Usage Guide
If you have existing Odoo project and want to use the `room_reservation` module, follow steps below:
1. Copy or move the `room_reservation` module to your addons directory
2. Go to your Odoo website and enable developer mode
3. Go to Apps menu, then choose Update Apps List submenu
4. Search for `room_reservation` module, then click Install button

Below are the steps to set up Odoo on your machine. Note that this guide assumes you have Docker installed. If you don't have one, you can follow the manuals on [Docker official website](https://docs.docker.com/manuals/).
1. Make sure Docker is properly installed on your machine by running `docker --version` command on your terminal.
2. Clone this repository.
```
git clone https://github.com/tsqfnfl/tunas-odoo.git
```
3. Get inside the repository.
```
cd tunas-odoo
```
4. Create password for your database. You can do that by execute following command on terminal:
```
$ echo "<YOUR_PASSWORD>" > odoo_pg_pass
```
5. In order to run the containers, run below command:
```
docker compose up -d
```
6. Once the process is complete, you can access Odoo website on [http://localhost:8069](http://localhost:8069)