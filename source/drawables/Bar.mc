using Toybox.WatchUi as Ui;

class Bar extends Ui.Drawable
{
    hidden var posX, posY, segmentation;
    hidden var filledRatio = 0;

    hidden var defaultHeight;
    hidden var defaultWidth;

    hidden var filledWidth = 0;

    function initialize(params){

        Drawable.initialize(params);

        posX = params.get(:x);
        posY = params.get(:y);
        segmentation=params.get(:segments);

        defaultHeight = Application.getApp().getProperty("BarThickness");
        defaultWidth = Application.getApp().getProperty("BarWidth");

    }

    function draw(dc)
    {
        var outline = Ui.loadResource(Rez.Drawables.BarOutline);

        dc.drawBitmap(posX, posY, outline);

        dc.fillRectangle(posX, posY, filledWidth, defaultHeight);

    }

    function setSegmentation(value){

        if(value < 1){
            throw new Exception("Invalid value of setSegmentation: " + value);
        }

        segmentation = value;
    }

    function setFill(value){

        if(value >= 0 && value <= segmentation){

                filledWidth = Math.floor(defaultWidth * (value.toDouble()/segmentation.toDouble()));

            } else {
                throw new Exception("Invalid value");
            }
    }
}