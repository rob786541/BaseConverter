# Base Converter for Multiple Numeric Systems
This class provides methods for converting numbers between different numeral systems.
It supports conversions between decimal and various bases (e.g., binary, octal, hexadecimal, base-62).
Additionally, it allows incrementing a base-specific number without converting.

Features<br>
- Convert from decimal to any base (e.g., 10 → 'A' in base-16)
- Convert from any base to decimal (e.g., 'A' → 10 in base-16)
- Increment a base-specific number using `next` (e.g., 'Z' → '10' in base-36)
- Supports up to base-62 using alphanumeric characters

SAP Basis Component: 757 SP 4 or higher

```ABAP
zcl_base_converter=>decimal_to_base( i_number = 62 i_base = zcl_base_converter=>system-base62 ) "=> 10
zcl_base_converter=>base_to_decimal( i_number = '10000000000' i_base = zcl_base_converter=>system-binary ) "=> 1024
zcl_base_converter=>get_next_number( i_number = 'FF' i_base = zcl_base_converter=>system-hex ) "=> 100
zcl_base_converter=>get_next_number( i_number = '11' i_base = zcl_base_converter=>system-binary ) "=> 100
```
