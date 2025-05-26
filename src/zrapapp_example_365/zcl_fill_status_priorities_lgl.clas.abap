CLASS zcl_fill_status_priorities_lgl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fill_status_priorities_lgl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*
    DELETE FROM zdt_status2_lgl.
    DELETE FROM zdt_priori_lgl.
    DELETE FROM zdt_incident_lgl.

* Fill Status Data
    INSERT zdt_status2_lgl FROM TABLE @( VALUE #( ( status_code = 'OP'
                                                   status_description = 'Open' )
                                                 ( status_code = 'IP'
                                                   status_description = 'In Progress' )
                                                 ( status_code = 'PE'
                                                   status_description = 'Pending' )
                                                 ( status_code = 'CO'
                                                   status_description = 'Completed' )
                                                 ( status_code = 'CL'
                                                   status_description = 'Closed' )
                                                 ( status_code = 'CN'
                                                   status_description = 'Canceled' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Status were added| ).
    ENDIF.

* Fill Priority Data
    INSERT zdt_priori_lgl FROM TABLE @( VALUE #( ( priority_code = 'H'
                                                     priority_description = 'High' )
                                                   ( priority_code = 'M'
                                                     priority_description = 'Medium' )
                                                   ( priority_code = 'L'
                                                     priority_description = 'Low' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Priorities were added| ).
    ENDIF.


* Fill Incident Data
    INSERT zdt_incident_lgl FROM TABLE @( VALUE #( ( inc_uuid = cl_system_uuid=>create_uuid_x16_static( )
                                                     incident_id = '12123'
                                                     title = 'title'
                                                     description = 'High' )
                                                    ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Priorities were added| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
