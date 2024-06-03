import fs from "fs";
import path from "path";
import { generateEmailVerifierInputs } from "@zk-email/helpers";

// Define the InputGenerationArgs type
type InputGenerationArgs = {
  ignoreBodyHashCheck?: boolean;
  shaPrecomputeSelector?: string;
  maxHeadersLength?: number; // Max length of the email header including padding
  maxBodyLength?: number; // Max length of the email body after shaPrecomputeSelector including padding
};

async function readEmail(filePath: string): Promise<Buffer | string> {
  return fs.readFileSync(filePath, "utf8");
}

async function main() {
  const emailPath = path.join(__dirname, "emls", "RawEmail.eml");
  const rawEmail = await readEmail(emailPath);

  // Define params if needed. Customize these values based on your requirements.
  const params: InputGenerationArgs = {
    ignoreBodyHashCheck: false, // Set to true if you want to ignore body hash check
    shaPrecomputeSelector: "AAPL", // Customize as needed
    maxHeadersLength: 576, // Example value, customize as needed
    maxBodyLength: 192, // Example value, customize as needed
  };

  // Call the function to generate verifier inputs
  const verifierInputs = await generateEmailVerifierInputs(rawEmail, params);

  // Write verifier inputs to a JSON file
  const jsonFilePath = path.join(__dirname, "input.json");
  fs.writeFileSync(jsonFilePath, JSON.stringify(verifierInputs, null, 2));
  adjustEmailBodySize();

  console.log("Verifier Inputs:", verifierInputs);
}

function adjustEmailBodySize() {
  // Read the JSON data from the input file
  fs.readFile("input.json", "utf8", (err, data) => {
    if (err) {
      console.error("Error reading the input file:", err);
      return;
    }

    let jsonData = JSON.parse(data);

    // Function to keep the first 192 elements and remove the last 64 elements
    function truncateEmailBody(array: any[]) {
      if (array.length === 256) {
        return array.slice(0, 192);
      } else {
        console.error("The length of the emailBody array is not 256.");
        return array;
      }
    }

    // Adjust the emailBody array
    jsonData.emailBody = truncateEmailBody(jsonData.emailBody);

    // Update emailBodyLength after modifying emailBody
    jsonData.emailBodyLength = jsonData.emailBody.length.toString();

    // Save the adjusted data back to the JSON file
    fs.writeFile(
      "input.json",
      JSON.stringify(jsonData, null, 4),
      "utf8",
      (err) => {
        if (err) {
          console.error("Error writing the output file:", err);
          return;
        }
        console.log(
          "The emailBody array has been truncated to the first 192 elements."
        );
      }
    );
  });
}

main().catch((err) => {
  console.error("Error:", err);
});
