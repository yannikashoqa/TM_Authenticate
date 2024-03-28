# TM_Authenticate

API DOCUMENTATION
- Deep Security" https://automation.deepsecurity.trendmicro.com/article/20_0/
- Deep Security SOAP and REST API SDK: https://help.deepsecurity.trendmicro.com/Deep_Security_20_0_WebService_SDK.zip
- 

DEEP SECURITY
  SOAP:
  - SOAP API endpoint: https://dsm.example.com:4119/webservice/Manager?WSDL
  - Create a DS-Config.json with the following content
~~~~JSON
    {
        "MANAGER": "dsm.example.com",
        "PORT": "4119",
        "USER_NAME": "",
        "PASSWORD": ""
    }
~~~~

  Legacy REST
  - REST API endpoint: https://dsm.example.com:4119/rest/

CLOUD ONE WORKLOAD SECURITY
  SOAP
  - REST API endpoint: https://workload.{region}.cloudone.trendmicro.com/webservice/Manager?WSDL
  - If yoiu are going to use an external config file, create a WS-Config.json with the following content and change the script to call out the config data.
~~~~JSON
    {
        "MANAGER": "workload.{region}.cloudone.trendmicro.com",
        "PORT": "4119",
        "USER_NAME": "",
        "PASSWORD": ""
    }
~~~~
  Legacy REST
  - REST API endpoint: https://workload.{region}.cloudone.trendmicro.com/rest

  RESTFUL
  - RESTful API endpoint: https://workload.{region}.cloudone.trendmicro.com/api