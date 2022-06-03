describe('test', () => {

  const a = {
      foo: 'bar',
      created: new Date(),
      environment: 'production',
      test: 12345,
      id: '12434-124455-114454',
      owner: 'rethab',
      repo: 'actions-test-repo',
  };

  const b = { ...a, created: new Date(new Date().getTime() + 100) };


  it('which line is the error reported?', () => {
    expect(a).toStrictEqual(b);
  });

});
