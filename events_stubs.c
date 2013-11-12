#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/memory.h>
#include <caml/signals.h>

CAMLprim value call_callback(value channel, value data)
{
    CAMLparam2(channel, data);
    static value *func = NULL;

    if (NULL == func) {
        func = caml_named_value("event_callback");
    }

    caml_callback2(*func, channel, data);

    CAMLreturn(Val_unit);
}
