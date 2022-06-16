%dw 2.0
output application/json
---
{
    code: "413",
    message:  "Request Entity Too Large",
    raw:  error.description  as String default ""
}





