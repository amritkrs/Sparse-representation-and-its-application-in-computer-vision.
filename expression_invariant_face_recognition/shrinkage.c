#include "mex.h"
void shrinkage(double *tau_v, double lambda, double *result_v , mwSize m)
{
    double tau;
    size_t i;
    for(i=0; i<m; i++)
    {
        tau = tau_v[i];
        /*mexPrintf("\n 1 %f, %f %f",tau, lambda , result_v[i]);*/
        if( tau >= -lambda && tau <= lambda   )
        {
            /*mexPrintf("\n%f, %f",abs(lambda),tau);*/
            result_v[i] = 0;
        }
        else
        {
            mwSize sign;
            if(tau > 0)
                sign = 1;
            else 
                sign = -1;
            result_v[i] = tau - sign*lambda ;
        
        }
  
    }       
    /*mexPrintf("%f",result_v[3]);*/
}

void mexFunction( int nlhs, mxArray *plhs[] , int nrhs, const mxArray *prhs[] )
{
   double *tau;
   double lambda;
   double *result;
   mwSize m;
    
    tau = mxGetPr(prhs[0]);
    m = mxGetM(prhs[0]);
    
    lambda = mxGetScalar(prhs[1]);

    /*plhs[0] = mxCreateDoubleScalar(0);*/
    plhs[0] = mxCreateDoubleMatrix(m,1,mxREAL);
    result = mxGetPr(plhs[0]);
    
    shrinkage(tau,lambda,result,m);
}