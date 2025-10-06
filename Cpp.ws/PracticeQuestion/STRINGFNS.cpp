int str_len(const char *str){
    int count=0;
    while(*str!='\0'){
        count++;
        str++;
    }
    return count;
}

char* str_cpy(char *dest, const char *src){
    char *temp = dest;
    while(*src!='\0'){
        *dest = *src;
        dest++;
        src++;
    }
    *dest = '\0';
    return temp;
}

char* str_cat(char *dest, const char *src){
    char *temp = dest;
    while(*dest!='\0'){
        dest++;
    }
    while(*src!='\0'){
        *dest = *src;
        dest++;
        src++;
    }
    *dest = '\0';
    return temp;
}

int str_cmp(const char *str1, const char *str2){
    while(*str1!='\0' && *str2!='\0'){
        if(*str1!=*str2){
            return (*str1-*str2);
        }
        str1++;
        str2++;
    }
    if(*str1=='\0' && *str2=='\0'){
        return 0;
    }
    else if(*str1=='\0'){
        return -1;
    }
    else{
        return 1;
    }
}