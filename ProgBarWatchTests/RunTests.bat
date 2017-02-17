@echo off
echo "====Running the unit tests===="
echo "Start your horses"
call connectiq

"C:\Program Files\Java\jre1.8.0_121\bin\java" -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true -jar "C:\ConnectIQ SDKs\connectiq-sdk-win-2.2.4\bin\monkeybrains.jar" -o "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\bin\ProgBarWatchTests.prg" -w -y F:\Keys\Garmin.der -z "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources\drawables\drawables.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources\layouts\layout.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources\settings\properties.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources\settings\settings.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources\strings\strings.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources-ces\strings\strings.xml";"F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\resources-deu\strings\strings.xml" -m "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\manifest.xml" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\source\ProgBarWatchViewMock.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\source\ProgBarWatchTestsApp.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\Tests\DateTimeUtility\DateTimeUtilityTests.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\Tests\ActivityUtility\ActivityUtilityTests.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchTests\Tests\ActivityUtility\ActivityInfoMock.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\source\utility\SystemUtility.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\source\utility\DateTimeUtility.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\source\utility\ActivityUtility.mc" "F:\Eclipse workspace\ProgBarWatch\ProgBarWatchApplication\source\ProgBarWatchView.mc" --unit-test

echo "Do the monkey business..."
call monkeydo.bat ".\bin\ProgBarWatchTests.prg" /t > "TestResult.txt"
echo "Tests done, see the results..."
