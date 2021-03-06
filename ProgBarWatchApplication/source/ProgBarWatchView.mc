using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.ActivityMonitor as Act;
using DateTimeUtility as Dut;
using ActivityUtility as Aut;
using SystemUtility as Sut;

class ProgBarWatchView extends Ui.WatchFace {
    	
  	hidden const MAX_PERCENT = 100; 	
  	
  	hidden var daysPerMonth = 30;  	
  
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	Dut.now();
    	me.daysPerMonth = Dut.getDaysPerCurrentMonth();
    }

    // Update the view
    function onUpdate(dc) {

        //Reload the necessary information
        Dut.now();
        var actInfo = Act.getInfo();
        Aut.setActInfo(actInfo);

        //Update the views

        updateBar("HourBar", Dut.getCurrentHour(), Dut.HOURS_PER_DAY, dc);
        updateBar("MinuteBar", Dut.getCurrentMinute(), Dut.MINUTES_PER_HOUR, dc);
        updateBar("MonthBar", Dut.getCurrentMonth(), Dut.MONTHS_PER_YEAR,  dc);
        updateBar("DayBar", Dut.getCurrentDay(), me.daysPerMonth, dc); //This one is specific...different count of days in the month...
        updateBar("StepsBar", Aut.getStepsGoalPercent(), MAX_PERCENT, dc);
        updateBar("BatteryBar", Sut.getBattery(), MAX_PERCENT, dc);


        var devSettings = Sys.getDeviceSettings();
        updateNotificationIcon("BluetoothNotification", devSettings.phoneConnected, dc);
        updateNotificationIcon("MessageNotification", devSettings.notificationCount > 0, dc);
        updateNotificationIcon("AlarmNotification", devSettings.alarmCount > 0, dc);
        updateNotificationIcon("MoveNotification", Aut.shouldMove(), dc);

        View.onUpdate(dc);
    }

    //! Update the notification icon.
    hidden function updateNotificationIcon(iconId, visible, dc){
        System.println("Updating " + iconId + ": visible: " + visible );

        var icon = View.findDrawableById(iconId);
        icon.setVisible(visible);
        icon.draw(dc);
    }

    //! Update the progress bar with new value.
    hidden function updateBar(barId, value, maximum,  dc){

        var bar = View.findDrawableById(barId);
        bar.setFillRatio(value.toFloat()/maximum.toFloat());
        bar.draw(dc);
    }

    hidden function updateTextField(fieldId, value, format){

        var color = Gfx.COLOR_BLUE;
        var updatedDrawable = View.findDrawableById(fieldId);
        updatedDrawable.setColor(color);
        updatedDrawable.setText(value.format(format));
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {

    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {

    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {

    }

}
