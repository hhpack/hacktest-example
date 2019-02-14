namespace Example\Test;

use Example\Stack;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class StackTest extends HackTest {
  public function testAddToStack(): void {
    $stack = new Stack(new Set());
    $stack->add("A");

    expect($stack->count())->toBeSame(1);
  }
}
