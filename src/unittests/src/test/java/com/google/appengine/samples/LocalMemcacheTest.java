
package unittests.src.test.java.com.google.appengine.samples;


// [START imports]
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.google.appengine.tools.development.testing.LocalMemcacheServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
// [END imports]

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

// [START NameAndHelper]
public class LocalMemcacheTest {

  private final LocalServiceTestHelper helper =
      new LocalServiceTestHelper(new LocalMemcacheServiceTestConfig());

  // [END NameAndHelper]

  @Before
  public void setUp() {
    helper.setUp();
  }

  @After
  public void tearDown() {
    helper.tearDown();
  }

  // run this test twice to prove we're not leaking any state across tests

  // [START doTest]
  private void doTest() {
    MemcacheService ms = MemcacheServiceFactory.getMemcacheService();
    assertFalse(ms.contains("yar"));
    ms.put("yar", "foo");
    assertTrue(ms.contains("yar"));
  }
  // [END doTest]

  @Test
  public void testInsert1() {
    doTest();
  }

  @Test
  public void testInsert2() {
    doTest();
  }
}
