#include <string.h>

#include "../parser.h"

extern int strcmp(const char*,const char*); 

extern char Data_Type[50];

int isValidAssignment(char* givenDatatype){
    int i=0;

    if(strcmp(givenDatatype,Data_Type) != 0){
        return 0;
    }
    return 1;
}

char* itoa(int number){
   static char buffer[33];
  snprintf(buffer, sizeof(buffer), "%d", number);
  return buffer;
}

char* ftoa(float number){
   static char buffer[33];
  snprintf(buffer, sizeof(buffer), "%f", number);
  return buffer;
}

char* ctoa(char number){
  static char buffer[33];
  snprintf(buffer, sizeof(buffer), "%c", number);
  return buffer;
}