abstract class LocalStorageProvider<T> {
  Future<void> add(T entity);

  Future<void> update(T entity);

  Future<void> delete(T entity);

  Future<void> deleteById(int id);

  Future<T?> getById(int id);
}
