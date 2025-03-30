"! <h2>Base Converter for Multiple Numeric Systems</h2>
"! <p>This class provides methods for converting numbers between different numeral systems.
"! It supports conversions between decimal and various bases (e.g., binary, octal, hexadecimal, base-62).
"! Additionally, it allows incrementing a base-specific number without converting.</p>
"!
"! <p>Features<br>
"! - Convert from decimal to any base (e.g., 10 → 'A' in base-16)<br>
"! - Convert from any base to decimal (e.g., 'A' → 10 in base-16)<br>
"! - Increment a base-specific number using `next` (e.g., 'Z' → '10' in base-36)<br>
"! - Supports up to base-62 using alphanumeric characters</p>
"!
"! <p>Example<br>
"! DATA(result) = zcl_base_converter=>decimal_to_base( i_number = 2 i_base = zcl_base_converter=>system-binary ).  " result = 10</p>
"!
"! <p>Author Robert<br>
"! Version 1.0<br>
"! Since 2025-03-30</p>
CLASS zcl_base_converter DEFINITION PUBLIC FINAL CREATE PRIVATE.

  PUBLIC SECTION.
    CONSTANTS:
      BEGIN OF system,
        binary  TYPE i VALUE 2,
        octal   TYPE i VALUE 8,
        decimal TYPE i VALUE 10,
        hex     TYPE i VALUE 16,
        base36  TYPE i VALUE 36,
        base62  TYPE i VALUE 62,
      END OF system.

    "! Converts a number from a given base to decimal.
    "! @parameter i_number | The number as a string in the given base.
    "! @parameter i_base   | The base of the number.
    "! @parameter r_result | The decimal representation of the input.
    CLASS-METHODS base_to_decimal
      IMPORTING i_number        TYPE string
                i_base          TYPE i DEFAULT system-hex
      RETURNING VALUE(r_result) TYPE decfloat34.

    "! Converts a number from decimal to a given base.
    "! @parameter i_number | The number in decimal.
    "! @parameter i_base   | The new base of the number.
    "! @parameter r_result | The number represented in the given base.
    CLASS-METHODS decimal_to_base
      IMPORTING i_number        TYPE decfloat34
                i_base          TYPE i DEFAULT system-hex
      RETURNING VALUE(r_result) TYPE string.

    "! Increments a base-specific number by one.
    "! @parameter i_number | The number in the given base
    "! @parameter i_base   | Base of the number.
    "! @parameter r_result | The next number in sequence for the given base.
    CLASS-METHODS get_next_number
      IMPORTING i_number        TYPE string
                i_base          TYPE i DEFAULT system-hex
      RETURNING VALUE(r_result) TYPE string.

  PRIVATE SECTION.
    CONSTANTS c_base_chars TYPE string VALUE '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.
ENDCLASS.


CLASS zcl_base_converter IMPLEMENTATION.
  METHOD base_to_decimal.
    DATA l_factor TYPE decfloat34 VALUE 1.

    IF NOT ( i_number CA c_base_chars ).
      RETURN.
    ENDIF.
    DATA(len) = strlen( i_number ).
    DO len TIMES.
      len -= 1.
      DATA(char) = i_number+len(1).
      FIND char IN c_base_chars MATCH OFFSET DATA(off).
      r_result += ( off * l_factor ).
      l_factor *= i_base.
    ENDDO.
  ENDMETHOD.

  METHOD decimal_to_base.
    IF i_number = 0.
      r_result = c_base_chars(1).
      RETURN.
    ENDIF.
    DATA(number) = i_number.
    WHILE number > 0.
      DATA(remainder) = number MOD i_base.
      r_result = c_base_chars+remainder(1) && r_result.
      number = number DIV i_base.
    ENDWHILE.
  ENDMETHOD.

  METHOD get_next_number.
    DATA overflow TYPE i.

    DATA(len) = strlen( i_number ).
    DO len TIMES.
      DATA(idx) = len - sy-index.
      DATA(char) = i_number+idx(1).
      FIND char IN c_base_chars MATCH OFFSET DATA(off).
      IF off < i_base - 1.
        off += 1.
        r_result = i_number+0(idx) && c_base_chars+off(1) && r_result.
        EXIT.
      ENDIF.
      overflow += 1.
    ENDDO.
    IF overflow = len.
      r_result = c_base_chars+1(1).
    ENDIF.
    DO overflow TIMES.
      r_result = |{ r_result }{ c_base_chars(1) }|.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
