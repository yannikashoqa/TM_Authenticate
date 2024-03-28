# TM_Authenticate

DEEP SECURITY
  SOAP:
  - SOAP API endpoint: https://dsm.example.com:4119/webservice/Manager?WSDL
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