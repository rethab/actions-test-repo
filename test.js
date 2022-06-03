describe('test', () => {

  const a = { created: new Date() };
  const b = { created: new Date(new Date().getTime() + 100) };

  it('which line is the error reported?', () => {
    expect(a).toStrictEqual(b);
  });

});
