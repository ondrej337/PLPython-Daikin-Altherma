# PLPython-Daikin-Altherma
Download data from Daikin Altherma to Postgres DB using PLPython

## 1. Instal Python Altherma
https://pypi.org/project/python-daikin-altherma/

pip install python-daikin-altherma

## 1.1 add lines to __init__.py:

    @property
    
    def tank_consumption(self) -> dict:
    
        """ Returns the tank energy consumption in kWh per [D]ay, [W]eek, [M]onth """
        
        return self._requestValueHP("2/Consumption/la", "m2m:rsp/pc/m2m:cin/con")
        
## 2. Create Schema daikin, mycron

    CREATE SCHEMA daikin;
    
    CREATE SCHEMA mycron;

## 2.1 Create table daikin.daikin_wrap:

  download file: daikin_wrap.sql

## 2.2 Create function mycron.py_daikin('IP_NUMBER')

  download file: daikin_function.sql
  
## 2.3 Call function:

  SELECT mycron.py_daikin('192.168.0.100');

