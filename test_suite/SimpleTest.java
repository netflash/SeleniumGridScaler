import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.Platform;

import java.net.URL;

public class SimpleTest {

  public static final String URL = "http://localhost:4444/wd/hub";

  public static void main(String[] args) throws Exception {

    DesiredCapabilities caps = DesiredCapabilities.chrome();
    caps.setBrowserName("chrome");
    caps.setPlatform(Platform.WINDOWS);
    caps.setCapability("uuid","testRun1");

    WebDriver driver = new RemoteWebDriver(new URL(URL), caps);

    /**
     * Goes to Sauce Lab's guinea-pig page and prints title
     */

    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("1 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("2 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("3 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("4 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("5 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("6 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("7 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("8 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("9 title of page is: " + driver.getTitle());
    driver.get("https://saucelabs.com/test/guinea-pig");
    System.out.println("0 title of page is: " + driver.getTitle());

    driver.quit();
  }
}
