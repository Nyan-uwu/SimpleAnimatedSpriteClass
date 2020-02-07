PVector DEFAULTSPRITESIZE;
Sprite mySprite;

void setup() {
    size(400, 400); background(0);
    
    // CHANGE TO YOUR VALUES - IN PIXELS //
    DEFAULTSPRITESIZE = new PVector(16, 17);
    mySprite = new Sprite(spriteTable[0][0], 3);
    // CHANGE TO YOUR VALUES - IN PIXELS //
    
    frameRate(6);
}

void draw() {
    background(0);
    mySprite.render(new PVector(100, 100), 0);
}

public class Sprite {
    private int aFrame    = 0;
    private int maxAframe = 0;
    private boolean isMoving = false;

    private PImage file;
    private PVector spriteSize;

    public Sprite(PImage pFile, PVector spriteSize, int imgFrames) {
        this.file       = pFile;
        this.spriteSize = spriteSize;
        this.maxAframe  = imgFrames;
    }
    public Sprite(PImage pFile, int imgFrames) {
        this.file       = pFile;
        this.spriteSize = new PVector(DEFAULTSPRITESIZE.x, DEFAULTSPRITESIZE.y);
        this.maxAframe  = imgFrames;
    }

    public void render(PVector renderPos, int dir) {
        image(this.file,
              int(renderPos.x),                             int(renderPos.y),
              int(this.spriteSize.x),                       int(this.spriteSize.y),
              int(this.spriteSize.x*dir),                   int(this.spriteSize.y*this.aFrame),
              int(this.spriteSize.x*dir+this.spriteSize.x), int(this.spriteSize.y*this.aFrame+this.spriteSize.y));
        this.aFrame++;
        if (this.aFrame >= this.maxAframe) this.aFrame = 0;
    }
}
