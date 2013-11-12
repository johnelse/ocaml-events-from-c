let callback ~channel ~data =
	Thread.delay 5.0;
	Event.sync (Event.send channel data)

external call_callback : string Event.channel -> string -> unit = "call_callback"

let () =
	Callback.register "event_callback" callback;
	let channel = Event.new_channel () in
	let (_: Thread.t) =
		Thread.create
			(fun () -> call_callback channel "test string") ()
	in
	Printf.printf "%s\n%!" "Waiting for callback event";
	let result = Event.sync (Event.receive channel) in
	Printf.printf "result = \"%s\"\n" result
