#include <stdio.h>

int main() {
    char str[20];
    int upper_counts[26] = {0};
    int lower_counts[26] = {0};
    int i = 0;
    printf("Enter a sentence:");
    fgets(str,20,stdin);
    while (str[i] != '\0') {
        char current_char = str[i];
        if (current_char >= 'A' && current_char <= 'Z') {
            upper_counts[current_char - 'A']++;
        }
        else if (current_char >= 'a' && current_char <= 'z') {
            lower_counts[current_char - 'a']++;
        }
        i++;
    }
    printf("Alphabet Occurrences:\n");
    for (i = 0; i < 26; i++) {
            printf("%c: %d\t%c: %d\n", 'A' + i, upper_counts[i],'a'+i,lower_counts[i]);
    }

    return 0;
}
