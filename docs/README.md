<br />
<img alt="Header" src="https://raw.githubusercontent.com/sbertix/SwiftenAI/master/Resources/header.png" height="72" />
<br />

[![Swift](https://img.shields.io/badge/Swift-5.7-%23DE5C43?style=flat&logo=swift)](https://swift.org)
<br />
![iOS](https://img.shields.io/badge/iOS-13.0-E1778E)
![macOS](https://img.shields.io/badge/macOS-10.15-E1778E)
![tvOS](https://img.shields.io/badge/tvOS-13.0-E1778E)
![watchOS](https://img.shields.io/badge/watchOS-6.0-E1778E)

<br />

**SwiftenAI** is a wrapper for [**OpenAI**](https://beta.openai.com/docs) API, written entirely in (modern) **Swift**, supporting both **Combine** and _structured concurrency_ (`async`/`await`).

## Status
![GitHub release (latest by date)](https://img.shields.io/github/v/release/sbertix/SwiftenAI)

You can find all changelogs directly under every [release](https://github.com/sbertix/SwiftenAI/releases).

[Milestones](https://github.com/sbertix/SwiftenAI/milestones), [issues](https://github.com/sbertix/SwiftenAI/issues), are the best way to keep updated with active developement.

Feel free to contribute by sending a [pull request](https://github.com/sbertix/SwiftenAI/pulls).
Just remember to refer to our [guidelines](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md) beforehand.

<p />

## Installation
### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency…` from the menu.
1. Paste `https://github.com/sbertix/SwiftenAI.git`.
1. Follow the steps.

## Usage

### Secret

Create a `Secret`, holding reference to your API token, and, optionally, an organization identifier.

```swift
let secret: Secret = .init(key: <MY_API_TOKEN>)
```

### Completion

> The completions endpoint can be used for a wide variety of tasks. 
> You input some text as a prompt, and the model will generate a text completion 
> that attempts to match whatever context or pattern you gave it. For example,
> if you give the API the prompt, "As Descartes said, I think, therefore", 
> it will return the completion " I am" with high probability.

Define a completion, using all the properties supported by the request, or just a subset, relying on default values.  

```swift 
let completion = Endpoints.Completion(
    model: .gpt3(.ada),
    prompt: "Why is the sky blue?"
)
let response = try await completion
    .process()
    .unlock(with: secret)
    .resolve(with: .shared) // `URLSession.shared`
```

We're using `URLSession.shared` but you can substitute it with any other `URLSession`, or you can even use a 
completely different networking framework, by conforming to **ComposableRequest** `EndpointResolver`. 

### Edit

> Given a prompt and an instruction, the model will return an edited version of the prompt.

Define an edit, using all the properties supported by the request, or just a subset, relying on default values.

```swift
let edit = Endpoints.Edit(
    input: "I'm a bot",
    instruction: "Write it in second person"
)
let response = try await edit
    .process()
    .unlock(with: secret)
    .resolve(with: .shared)
```
