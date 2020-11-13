class Surface {

    PImage sol = loadImage("surface.png");
    int x1;
    int x2;
    int y;
    int rate = 5;
    int minDist = 400;
    int cpt = 0;
    int cptWait = 10;
    boolean beginGeneratingTrees = false;
    boolean collision = false;
    ArrayList < Tree > trees = new ArrayList < Tree > ();


    Surface(int x, int y) {
        this.x1 = x;
        this.x2 = x + 1200;
        this.y = y;
    }

    void draw(T_Rex Trex) {
        image(sol, x1, y, 1200, 12);
        image(sol, x2, y, 1200, 12);
        if (!beginGeneratingTrees) {
            cpt++;
            if (cpt == cptWait) {
                beginGeneratingTrees = true;
            }
        } else {
            collision = treeEvolution(Trex);
        }
    }

    boolean collisionVerif(Tree tree, T_Rex Trex) {
        if (tree.x <= Trex.x + 44 && tree.x + tree.image.width >= Trex.x)
            if (Trex.y + 44 >= tree.y)
                return true;
        return false;
    }

    boolean treeEvolution(T_Rex Trex) {

        ArrayList < Tree > treesToRemove = new ArrayList < Tree > ();
        for (Tree tree: trees) {
            if (collisionVerif(tree, Trex))
                return true;
            tree.draw();
            tree.x -= rate;
            if (tree.x < 0) {
                treesToRemove.add(tree);
            }
        }
        if (trees.size() > 0) {
            trees.removeAll(treesToRemove);
            if (trees.get(trees.size() - 1).x + minDist < 1200) {
                Tree tree = new Tree(trees.get(trees.size() - 1).x + minDist, y);
                trees.add(tree);
                tree.draw();
            }
        } else {
            Tree tree = new Tree(1200, y);
            trees.add(tree);
            tree.draw();
        }
        return false;

    }

    void move() {
        x1 -= rate;
        x2 -= rate;
        if (x1 <= -1200)
            x1 = 1200;
        if (x2 <= -1200)
            x2 = 1200;
    }
}