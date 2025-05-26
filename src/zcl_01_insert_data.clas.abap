CLASS zcl_01_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_01_insert_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
* Clean table for Data test
    DELETE FROM zdt_status2_lgl.

* Fill Status Data
    INSERT zdt_flight_365 FROM TABLE @( VALUE #( ( carrier_id = 'AA'
                                                   connection_id = '0001'
                                                   price = '100'
                                                   currency_code = 'USD'
                                                   plane_type_id = 'AAA-001'
                                                   status = '01' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Flight Data were added| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
