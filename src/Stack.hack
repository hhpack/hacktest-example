namespace Example;

final class Stack<T> {
  public function __construct(private Set<T> $items) {
  }

  public function add(T $value): void {
    $this->items->add($value);
  }

  public function count(): string {
    return $this->items->count();
  }
}
