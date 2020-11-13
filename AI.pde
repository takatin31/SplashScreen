class AI {

    double w1;
    double b;
    AI() {
        w1 = random(0, 1);
        b = random(0, 1);
    }


    boolean getEvaluation(double m1) {
        if (m1 < 100) return true;
        else return false;
    }

   
}
