CLASS ltc_converter_test DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS to_62_1    FOR TESTING.
    METHODS to_62_2    FOR TESTING.
    METHODS to_hex     FOR TESTING.
    METHODS to_binary  FOR TESTING.
    METHODS to_decimal FOR TESTING.
    METHODS to_dec_1   FOR TESTING.
    METHODS to_dec_2   FOR TESTING.
    METHODS to_dec_3   FOR TESTING.
    METHODS next_1     FOR TESTING.
    METHODS next_2     FOR TESTING.
    METHODS next_3     FOR TESTING.
ENDCLASS.


CLASS ltc_converter_test IMPLEMENTATION.
  METHOD next_1.
    cl_abap_unit_assert=>assert_equals(
        exp = '1'
        act = zcl_base_converter=>get_next_number( i_number = '0'
                                                   i_base   = zcl_base_converter=>system-binary ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '11'
        act = zcl_base_converter=>get_next_number( i_number = '10'
                                                   i_base   = zcl_base_converter=>system-binary ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '100'
        act = zcl_base_converter=>get_next_number( i_number = '11'
                                                   i_base   = zcl_base_converter=>system-binary ) ).
  ENDMETHOD.

  METHOD next_2.
    cl_abap_unit_assert=>assert_equals( exp = '10'
                                        act = zcl_base_converter=>get_next_number( 'F' ) ).
    cl_abap_unit_assert=>assert_equals( exp = '100'
                                        act = zcl_base_converter=>get_next_number( 'FF' ) ).
    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = zcl_base_converter=>get_next_number( '0' ) ).
  ENDMETHOD.

  METHOD next_3.
    cl_abap_unit_assert=>assert_equals(
        exp = '10'
        act = zcl_base_converter=>get_next_number( i_number = 'z'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '100'
        act = zcl_base_converter=>get_next_number( i_number = 'zz'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '1'
        act = zcl_base_converter=>get_next_number( i_number = '0'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
  ENDMETHOD.

  METHOD to_62_1.
    cl_abap_unit_assert=>assert_equals(
        exp = '0'
        act = zcl_base_converter=>decimal_to_base( i_number = 0
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '9'
        act = zcl_base_converter=>decimal_to_base( i_number = 9
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'A'
        act = zcl_base_converter=>decimal_to_base( i_number = 10
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
  ENDMETHOD.

  METHOD to_62_2.
    cl_abap_unit_assert=>assert_equals(
        exp = 'z'
        act = zcl_base_converter=>decimal_to_base( i_number = 61
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '10'
        act = zcl_base_converter=>decimal_to_base( i_number = 62
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'KyXecRaPqzvjQ8BcV'
        act = zcl_base_converter=>decimal_to_base( i_number = 999999999999999999999999999999
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
  ENDMETHOD.

  METHOD to_hex.
    cl_abap_unit_assert=>assert_equals( exp = '11'
                                        act = zcl_base_converter=>decimal_to_base( 17 ) ).
    cl_abap_unit_assert=>assert_equals( exp = '611'
                                        act = zcl_base_converter=>decimal_to_base( 1553 ) ).
  ENDMETHOD.

  METHOD to_binary.
    cl_abap_unit_assert=>assert_equals(
        exp = '11'
        act = zcl_base_converter=>decimal_to_base( i_number = 3
                                                   i_base   = zcl_base_converter=>system-binary ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '10000000000'
        act = zcl_base_converter=>decimal_to_base( i_number = 1024
                                                   i_base   = zcl_base_converter=>system-binary ) ).
  ENDMETHOD.

  METHOD to_decimal.
    cl_abap_unit_assert=>assert_equals(
        exp = '10'
        act = zcl_base_converter=>decimal_to_base( i_number = 10
                                                   i_base   = zcl_base_converter=>system-decimal ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '99'
        act = zcl_base_converter=>decimal_to_base( i_number = 99
                                                   i_base   = zcl_base_converter=>system-decimal ) ).
  ENDMETHOD.

  METHOD to_dec_1.
    cl_abap_unit_assert=>assert_equals( exp = '17'
                                        act = zcl_base_converter=>base_to_decimal( '11' ) ).
    cl_abap_unit_assert=>assert_equals( exp = '1553'
                                        act = zcl_base_converter=>base_to_decimal( '611' ) ).
  ENDMETHOD.

  METHOD to_dec_2.
    cl_abap_unit_assert=>assert_equals(
        exp = '3'
        act = zcl_base_converter=>base_to_decimal( i_number = '11'
                                                   i_base   = zcl_base_converter=>system-binary ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '1024'
        act = zcl_base_converter=>base_to_decimal( i_number = '10000000000'
                                                   i_base   = zcl_base_converter=>system-binary ) ).
  ENDMETHOD.

  METHOD to_dec_3.
    cl_abap_unit_assert=>assert_equals(
        exp = '0'
        act = zcl_base_converter=>base_to_decimal( i_number = '0'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '61'
        act = zcl_base_converter=>base_to_decimal( i_number = 'z'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '62'
        act = zcl_base_converter=>base_to_decimal( i_number = '10'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
    cl_abap_unit_assert=>assert_equals(
        exp = '999999999999999999999999999999'
        act = zcl_base_converter=>base_to_decimal( i_number = 'KyXecRaPqzvjQ8BcV'
                                                   i_base   = zcl_base_converter=>system-base62 ) ).
  ENDMETHOD.
ENDCLASS.
