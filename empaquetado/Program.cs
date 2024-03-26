using System;
using System.IO;
using System.Diagnostics;

string url = "../../../../requerimientos.txt";
string contenido = File.ReadAllText(url);
Console.WriteLine(contenido);

ProcessStartInfo startInfo = new ProcessStartInfo
{
    FileName = "pip",
    Arguments = $"install -r \"{Path.GetFullPath(url)}",
    UseShellExecute = false,
    RedirectStandardOutput = true,
    RedirectStandardError = true,
    CreateNoWindow = true,
    WorkingDirectory = Path.GetDirectoryName(Path.GetFullPath(url))
};

using (Process? process = Process.Start(startInfo))
{
    if (process != null)
    {
        process.WaitForExit(); 
        string output = process.StandardOutput.ReadToEnd();
        string error = process.StandardError.ReadToEnd();
        Console.WriteLine("Output:");
        Console.WriteLine(output);
        Console.WriteLine("Error:");
        Console.WriteLine(error);
    }
    else
    {
        Console.WriteLine("Error: No se pudo iniciar el proceso.");
    }
}