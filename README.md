# GET_FIELD

----

## Description :

The GET_FIELD is an oracle sql function very efficent, created under GNU General Public License v3.0 to  
extract from a string with fields separated by a one or more characters a specific field by its position,  
if is not present function return null.  
  
Function have three input arguments :  
1. Input String
2. Separator String (It is possible specify more than a single character)
3. Field Number 
      
Function returns null if it's impossible determinate field at position specified in Field Number  
  
----

## Compatibility :

ORACLE 8 or upper


----

## Samples :
           
           GET_FIELD( '1|2|3|4','|',2 )

           result:
           ----------
           2  


           GET_FIELD( 'ARA;BAR;COO;SAA',';',5 )

           result:
           -----------
           null  
    
----

## License :

This project is licensed under the GNU GENERAL PUBLIC LICENSE 3.0 License - see the [LICENSE](LICENSE) file for details  
