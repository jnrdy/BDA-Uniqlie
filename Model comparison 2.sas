/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 09Jun2022:05:37:58
     Locale           : en_US
     Model Type       : Linear Regression
     Interval variable: Close
     Interval variable: Stock Trading
     Interval variable: Open
     Interval variable: Low
     Interval variable: High
     Interval variable: Volume
     Response variable: Close
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 09Jun2022:05:37:58
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;

   array _xrow_17488_0_{6} _temporary_;
   array _beta_17488_0_{6} _temporary_ (    16.4127748838363
       -5.1337474020262E-10
          -0.67207721903276
           0.87053992060946
           0.80111226550964
           0.00003815293689);

   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(Low) 
      or missing(Open) 
      or missing(Volume) 
      or missing(High) 
      or missing('Stock Trading'n) 
      then do;
         _badval_ = 1;
         goto skip_17488_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 6; _xrow_17488_0_{_i_} = 0; end;

   _xrow_17488_0_[1] = 1;

   _xrow_17488_0_[2] = 'Stock Trading'n;

   _xrow_17488_0_[3] = Open;

   _xrow_17488_0_[4] = Low;

   _xrow_17488_0_[5] = High;

   _xrow_17488_0_[6] = Volume;

   do _i_=1 to 6;
      _linp_ + _xrow_17488_0_{_i_} * _beta_17488_0_{_i_};
   end;

   skip_17488_0:
   label P_Close = 'Predicted: Close';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      P_Close = _linp_;
   end; else do;
      _linp_ = .;
      P_Close = .;
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'P_Close'n;
      'P_Close_17488'n='P_Close'n;
   /*------------------------------------------*/