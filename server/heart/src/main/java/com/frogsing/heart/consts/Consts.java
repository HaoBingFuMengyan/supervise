package com.frogsing.heart.consts;/**
 * Created by wesson on 2017/9/15.
 */

/**
 * Description:
 * <p>
 * Created by wesson on 2017/9/15.
 **/
public class Consts {
    public  enum BoolType implements  IConst{
        NO(0,"否"),
        YES(1,"是");
        public  static BoolType get(int i){
            switch(i)
            {
                case 0:
                    return BoolType.NO;
                case 1:
                    return BoolType.YES;
            }
            return null;
        }


        private   int   nCode ;
        private   String   nLabel ;
        private   BoolType ( int   _nCode,String _nlabel) {

            this. nCode  = _nCode;
            this.nLabel=_nlabel;
        }

        @Override
        public int val(){
            return nCode;
        }
        @Override
        public String label(){
            return nLabel;
        }
        @Override
        public String getLabel(){
            return nLabel;
        }
        @Override
        public int getVal(){
            return nCode;
        }
        @Override
        public IConst[] vals(){
            return BoolType.values();
        }

        @Override
        public IConst valof(String str) {

            return BoolType.valueOf(str);
        }

        @Override
        public boolean isEq(int i) {

            return nCode==i;
        }

        @Override
        public boolean isNot(int i) {

            return nCode!=i;
        }

    }
}
