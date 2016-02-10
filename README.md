# README #

Repo for monitoring POC using collectd influxdb and grafana.


### How do I get set up? ###

* Download the repo
* Run Vagrant up
* This will create 4 machines, 3 machines will have collectd and one machine will have grafana and influxDB
* Open grafana using URL : http://192.168.17.99:3000
* You will need to add data source - for which open the side menu by clicking the the Grafana icon in the top header. In the side menu, click Data Sources. Click on the Add New link in the top header to bring up the data source definition screen.
* Give a name, choose InfluxDB 0.9x, then http://192.168.17.99:8086 as DB URL, collectd as DB name and root/password as creds. After saving - click on data source and do a Test connection (test connection is available only on latest version of Grafana)
* For dashboards you can import the JSONs in templates directory or you can create your own.
* For everything to work - there has to be data in influxDB - which you can check in UI of influxDB at http://192.168.17.99:8083 . Refer to schema exploration page and search for schema and data in collectd DB: https://docs.influxdata.com/influxdb/v0.9/query_language/schema_exploration/
* memload.pl can be used on any of the machines to simulate load on memory

#
# Tech debts 
#

* Need a better way to import dashboards via Grafana API