
%dw 2.0
output application/json
---
{
    code: "406",
    message:  "Unsupported media type",
    raw:  error.description  as String default ""
}

