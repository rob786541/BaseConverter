# ABAP BaseConverter
This ABAP class provides methods for converting numbers between different numeral systems. Additionally, it allows incrementing a base-specific number without conversion.

SAP Basis Component: 757 SP 4 or higher

```ABAP
zcl_base_converter=>decimal_to_base( i_number = 62 i_base = zcl_base_converter=>system-base62 ) "=> 10
zcl_base_converter=>base_to_decimal( i_number = '10000000000' i_base = zcl_base_converter=>system-binary ) "=> 1024
zcl_base_converter=>get_next_number( i_number = 'FF' i_base = zcl_base_converter=>system-hex ) "=> 100
zcl_base_converter=>get_next_number( i_number = '11' i_base = zcl_base_converter=>system-binary ) "=> 100
```
