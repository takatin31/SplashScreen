class Tree {

    int x;
    int y;
    String treesImages[] = { "cactus0.png", "cactus1.png", "cactus2.png" };
    PImage image;

    Tree(int x, int y) {
        this.x = x;
        this.y = y;
        int i = floor(random(0, 3));
        image = loadImage(treesImages[i]);
    }

    void draw() {
        image(image, x, y - image.height + 10, image.width, image.height);
    }
}