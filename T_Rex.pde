class T_Rex {
    int x;
    int y;
    int topY = height - 200;
    boolean right = true;
    boolean isJumping = false;
    boolean isFalling = false;
    boolean inAir = false;
    int cptAir = 0;
    PImage Trex;

    T_Rex(int x, int y) {
        this.x = x;
        this.y = y;
        Trex = loadImage("T-rex0.png");
    }

    void draw() {
        image(Trex, x, y, 44, 44);
    }

    boolean verif(Surface sol) {
        if (sol.trees.size() > 0) {
            if (sol.trees.get(0).x - x < 100) {
                this.jump();
                return true;
            }
        }

        return false;
    }

    boolean verif2(Surface sol) {
        if (sol.trees.size() > 0) {
            if (sol.trees.get(0).x - x < 100 && !isJumping && !isFalling && !inAir) {
                return true;
            }
        }

        return false;
    }

    boolean move() {
        if (!isJumping && !isFalling && !inAir) {
            if (right) {
                Trex = loadImage("T-rex1.png");
            } else {
                Trex = loadImage("T-rex2.png");
            }
            right = !right;
        } else {
            Trex = loadImage("T-rex3.png");
            if (isJumping) {
                y -= 7;
                if (y <= topY) {
                    isJumping = false;
                    inAir = true;
                }
            } else
            if (inAir) {
                cptAir++;
                if (cptAir == 5) {
                    isFalling = true;
                    inAir = false;
                    cptAir = 0;
                }
            } else {
                y += 5;
                if (y >= height-83) {
                    y = height-83;
                    isFalling = false;
                }

            }
        }
        return (isJumping || isFalling || inAir);
    }

    void jump() {
        isJumping = true;
    }
}
