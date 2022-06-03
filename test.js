describe('test', () => {

  const a = { created: new Date() };
  const b = { created: new Date(new Date().getTime() + 100) };

  it('fails', () => {
    expect(a).toStrictEqual(b);
  });

});
