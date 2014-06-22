-module(entry).
-compile(export_all).

debit(Amount) ->
    debit_to_amount(Amount).

debit_to_amount(Debit) ->
    Debit.

credit(Amount) ->
    credit_to_amount(Amount).

credit_to_amount(Credit) ->
    -Credit.

bookkeeping({AccType, Account}, Amount) ->
    {AccType, Account, Amount}.

calculate({AccType, _Account, Amount}) ->
    Amount1 = erlang:apply(AccType, [Amount]).

show({AccType, Account, Amount}) ->
    case AccType of
        debit ->
            {Account, lists:flatten(io_lib:format("~B", [Amount]))};
        credit ->
            {Account, lists:flatten(io_lib:format("(~B)", [Amount]))}
    end.
