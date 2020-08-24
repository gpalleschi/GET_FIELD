/********************************************************************************************************************
    The GET_FIELD is an oracle sql function very efficent, created under GNU General Public License v3.0 to 
    extract from a string with fields separated by a one or more characters a specific field by its position, 
    if is not present function return null.

    Function have three input arguments :
        1) Input String
        2) Separator String (It is possible specify more than a single character)
        3) Field Number 
    
    Function returns null if it's impossible determinate field at position specified in Field Number

    samples:
    -------
           GET_FIELD( '1|2|3|4','|',2 )

           result:
           ----------
           2  


           GET_FIELD( 'ARA;BAR;COO;SAA',';',5 )

           result:
           -----------
           null  


    History of changes
    yyyy.mm.dd | Version | Author                | Changes
    -----------+---------+-----------------------+-------------------------
    2020.08.20 |  1.0    | Giovanni Palleschi    | First Release 

********************************************************************************************************************/

CREATE OR REPLACE FUNCTION get_field (iString IN VARCHAR2, iSeparator IN VARCHAR2, field_num IN NUMBER)
RETURN VARCHAR2
IS
   position_field_start NUMBER;
   position_field_end NUMBER;
BEGIN
  BEGIN
      position_field_start := INSTR(iString,iSeparator,1,field_num-1);
      IF ( position_field_start = 0 ) THEN
         return NULL;
      END IF;
      position_field_start := position_field_start+1;
  EXCEPTION
      WHEN OTHERS THEN
           position_field_start := 1;
  END;
  position_field_end   := INSTR(iString,iSeparator,position_field_start,1);
  IF position_field_end = 0 THEN
     position_field_end := length(iString)+1;
  END IF;

  return SUBSTR(iString,position_field_start,position_field_end-position_field_start);
END;
/