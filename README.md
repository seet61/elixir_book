# ElixirBook

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_book` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_book, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_book>.



https://github.com/sasa1977/elixir-in-action/blob/3rd-edition/code_samples
'



1/
https://github.com/seet61/elixir_book/blob/main/lib/chapter6/todo_server.ex
добавь в него :continue. В нем просто выведи Logger.info("message from continue")

и сделай такое же поведение, но через отправку сообщения себе

и расскажи в чем разница потом)

чутка в гену погрузимся)

это первая задача. 


2/ 
вторая: разобраться с trap exit. Выставляешь флаг этот, дальше на завершении выводи Logger.info("from termination")

и в тесте иммитацию EXIT сделай


и в обработке экзита: Logger.info("from exit")





3/
Нужно написать кэш процесс.
API:
1) put
2) get
3) delete
4) flushall

Данные должны храниться в ets.
Данные должны переживать перезапуск узла. Для этого юзай trap exit из прошлой задачи и вызовы 
https://www.erlang.org/doc/man/ets#file2tab-2 и https://www.erlang.org/doc/man/ets#tab2file-3
Если хочешь, можешь добавить компрессию данных в памяти.