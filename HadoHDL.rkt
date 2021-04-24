#lang typed/racket/no-check

{require (only-in racket/generic define-generics)} ; -> String

{define-generics Verilog-able (gen-verilog Verilog-able)}

{define-type Identifier Symbol}

{struct Module ([id : Identifier] [ports : (Listof Identifier)] [definitions : (Listof Definition)]) #:transparent}

{define-type Definition (U Variable Parameter)}

{struct Variable ([id : Identifier] [type : VariableType] [reg : Boolean] [range : VariableRange]) #:transparent}
{define-type VariableType (U VariableType-Internal VariableType-Input VariableType-Output VariableType-Inout)}
{struct VariableType-Internal () #:transparent}
{struct VariableType-Input () #:transparent}
{struct VariableType-Output () #:transparent}
{struct VariableType-Inout () #:transparent}
{define-type VariableRange (U VariableRange-Single VariableRange-FromTo)}
{struct VariableRange-Single () #:transparent}
{struct VariableRange-FromTo ([from : Expression] [to : Expression]) #:transparent}

{struct Parameter ([id : Identifier] [val : Expression]) #:transparent}

{define-type Expression
  (U
   Not And Or
   BitwiseAnd BitwiseOr BitwiseXOr BitwiseXNOr
   ReductionAnd ReductionNAnd ReductionOr ReductionNOr ReductionXOr ReductionXNOr
   Equal)}

{struct Not ([x : Expression]) #:transparent}
{struct And ([x : Expression] [y : Expression]) #:transparent}
{struct Or ([x : Expression] [y : Expression]) #:transparent}

{struct BitwiseAnd ([x : Expression] [y : Expression]) #:transparent}
{struct BitwiseOr ([x : Expression] [y : Expression]) #:transparent}
{struct BitwiseXOr ([x : Expression] [y : Expression]) #:transparent}
{struct BitwiseXNOr ([x : Expression] [y : Expression]) #:transparent}

{struct ReductionAnd ([x : Expression]) #:transparent}
{struct ReductionNAnd ([x : Expression]) #:transparent}
{struct ReductionOr ([x : Expression]) #:transparent}
{struct ReductionNOr ([x : Expression]) #:transparent}
{struct ReductionXOr ([x : Expression]) #:transparent}
{struct ReductionXNOr ([x : Expression]) #:transparent}

{struct Equal ([x : Expression] [y : Expression]) #:transparent}
