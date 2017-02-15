#include"mex.h"
#include<math.h>
void matrixNorm(double *a , double *result , mwSize m, mwSize n)
{
    mwSize i;
    double sum = 0;
    for(i=0;i<m*n;i++)
    {
            sum += (a[i]*a[i]);
    }
    
    *result = sqrt(sum);
}



void mexFunction( int nlhs, mxArray *plhs[] , int nrhs, const mxArray *prhs[] )
{
   double *result;
   double *inMatrixA;
   size_t m;
   size_t n;
   
   m = mxGetM(prhs[0]);
   n = mxGetN(prhs[0]);
    
   inMatrixA = mxGetPr(prhs[0]);
   plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
   result = mxGetPr(plhs[0]);
    
   matrixNorm(inMatrixA,result,m,n);
}