#include <stdio.h>

int main(){
    int mat[3][3];
    int row_sum[3]={0,0,0},col_sum[3]={0,0,0},diag_sum=0;
    for(int i=0;i<3;i++){
        printf("Enter 3 elements for %d row",i+1);
        for(int j=0;j<3;j++){
            scanf("%d",&mat[i][j]);
        }
    }

    for(int i = 0;i<3;i++){
        for(int j = 0;j<3;j++){
            row_sum[i]+=mat[i][j];
            col_sum[i]+=mat[j][i];
            
        }diag_sum += mat[i][i];
        if(col_sum[i]==row_sum[i]&&col_sum[i]==diag_sum){
            printf("It is Magic Matrix");
        }else{
            printf("It is not Magic Matrix");
        }
    }
    
        
}