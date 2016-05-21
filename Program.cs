using System;
using Mraa;
using System.Threading;

namespace HelloEdison
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Hello Edison!");

			var platform = Mraa.Mraa.GetPlatformType ();

			Gpio gpio;
			if (platform == Platform.INTEL_EDISON_FAB_C) {
				gpio = new Gpio (13);
			} else {
				throw new InvalidOperationException ("Cannot support platform: " + platform.ToString ());
			}

			Console.WriteLine ("Welcome to libmraa!\nVersion: {0}\nPlatform: {1}", Mraa.Mraa.GetVersion(), platform);

			gpio.Dir (Dir.DIR_OUT);

			var state = false;
			var value = default(int);

			while (true) {
				state = !state;
				value = Convert.ToInt32 (state);
				gpio.Write(value);

				Thread.Sleep (1000);
			}
		}
	}
}
