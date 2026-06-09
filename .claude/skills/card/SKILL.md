---
name: card
description: 'Create an Anki flash card for a Ukrainian-speaking learner of English. Use when the user runs /card <word>, or asks to create/add a flash card, vocab card, or Anki card for an English word or phrase. Produces a markdown file in vocab/.'
argument-hint: '<english word or phrase>'
---

# Create Flash Card

## When to Use

- User invokes `/card <word>` or `/card <phrase>`.
- User asks to create / add a flash card, vocab card, or Anki card for an English word or phrase.

## User Context

- **Native language**: Ukrainian
- **Learning language**: English
- **Learning approach**: Ukrainian sentence → English word/phrase with explanation

## Procedure

1. **Resolve the target.**
   - The argument is the target English word or phrase (everything after `/card`).
  - Before choosing the final target, check whether the user may have typed a different valid English item by mistake, especially spacing, hyphenation, or part-of-speech variants. Examples: `hang out` (phrasal verb) vs. `hangout` (noun), `work out` vs. `workout`, `check in` vs. `check-in`, `set up` vs. `setup`, `log in` vs. `login`.
  - If a possible typo or word-form confusion is noticed, explicitly ask which exact form the user means. Do not silently correct, merge, or choose one.
   - Filename: lowercase, kebab-case, `.md` extension, placed in `vocab/` (e.g. `work out` → `vocab/work-out.md`).
   - If the file already exists, tell the user and stop. Do not overwrite without explicit confirmation.

2. **Always verify the exact target and intended meaning with the user before creating the card.** Ask what exact word/phrase form, meaning, usage, or context they want the card to cover, even if one meaning is clearly the most common or likely option. Do not create the card until the user confirms the exact target and intended meaning.

  In the question, mention likely/common meanings when helpful:
    - **Ukrainian translations for options.** Whenever you provide selectable confirmation options, include a natural Ukrainian translation or short Ukrainian gloss for each option, so the user can choose based on meaning as well as English form.
  - **Possible typo or word-form confusion.** e.g. `hang out` = spend time socially, while `hangout` = a place where people often spend time; `work out` = exercise/solve, while `workout` = an exercise session. Ask which exact form they want.
  - **Multiple distinct meanings.** e.g. `work out` (exercise vs. calculate), `turn up` (arrive vs. be found/discovered), `run` (jog vs. operate vs. manage). Offer: one meaning (which?) or both on one card.
  - **Different part of speech with different meaning.** e.g. `order` (noun: sequence/command vs. verb: request).
  - **Register / context changes the natural Ukrainian translation.** Ask for the intended context if it would materially change the front-side sentence.

  If the user already specified the meaning in the request (e.g. `/card turn-up — arrive`), briefly restate that meaning and ask for confirmation before proceeding.

3. **Compose the card** following the rules below.

4. **Write the file** at `vocab/<kebab-name>.md`. Never paste the card into chat.

5. **Confirm briefly.** Reply with the path created and the meaning(s) covered, in one short line.

## Required File Structure

Every card MUST follow this exact structure:

```markdown
# Flash Card: [English Word/Phrase]

## Front

[1st Ukrainian sentence with <u>underlined word/phrase</u>]
[2nd Ukrainian sentence with <u>underlined word/phrase</u>]

## Back

<div id="back">
  <strong>Translation</strong>: "English translation"<br /><br />
  <strong>Word</strong>: target word/phrase<br /><br />
  <strong>Explanation</strong>: definition in English<br /><br />
  <strong>Examples</strong>:<br />
  First example sentence.<br />
  Second example sentence.<br />
  Third example sentence.
</div>
```

## Front Side (Ukrainian)

- Sentence must be **entirely in Ukrainian** — never mix English words in.
- Underline the Ukrainian word/phrase that maps to the target English vocabulary with `<u>...</u>`.
- The underlined fragment is what the learner translates to English.
- Use natural, everyday Ukrainian that gives clear context for the meaning.

## Back Side (English)

Must include four components, in this order:

1. **Translation** — full English translation of the Ukrainian sentence(s) on the front.
2. **Word** — the target English vocabulary item.
3. **Explanation** — definition in English (prefer English over Ukrainian).
4. **Examples** — 2–3 English sentences showing typical usage.

## HTML Rules (Anki Rendering)

- Wrap the back content in `<div style="text-align: left;">` (or `<div id="back">` as in the structure above) for left alignment.
- Use `<strong>` for the labels: Translation, Word, Explanation, Examples.
- Use `<br /><br />` between sections, `<br />` between example sentences.
- Do NOT wrap example sentences in quotes.
- Do NOT use `<ul>` / `<li>` — line breaks only.
- Keep the HTML simple; complex markup may not render in Anki.

## Translation Accuracy

- **Direct translation**: If the Ukrainian sentence does not map cleanly to the English target, either pick a different Ukrainian example, or add a short hint in brackets after the sentence (e.g. `(not difficult)` for `challenging`).
- **Multiple meanings on one card**: put one Ukrainian sentence per meaning on the front, each with its own `<u>...</u>` matching that meaning. On the back, list all translations, number the meanings in the Explanation, and provide 3–4 examples covering all of them.
  - Example: `turn up` = "arrive/appear" and "be found/discovered" → use two Ukrainian sentences with different verbs (з'явився, знайшлися).
- **Context clarity**: the Ukrainian sentence must clearly point to the intended English meaning.

## Ukrainian Sentence Quality

- **Avoid near-synonyms**: do NOT put another Ukrainian word with a meaning close to the target English item in the same sentence (e.g. don't use "не здавайся" in a sentence aimed at "hang in").
- **Use hints sparingly**: only add a bracketed hint when the sentence alone does not point to the intended English meaning. Remove hints when the context already makes it clear.
- **Natural context**: the Ukrainian sentence should lead to the English word/phrase naturally, not forced.

## General Guidelines

- Focus on practical, commonly used English vocabulary.
- Ensure Ukrainian sentences are grammatically correct and natural.
- Keep English explanations clear and concise.
- Vary the example sentences to show different contexts.
- Prioritize vocabulary that comes up in everyday conversation.

## Example

```markdown
# Flash Card: Challenging

## Front

Я хочу вивчити нову мову, але це дуже <u>складно</u>. (not difficult)

## Back

<div style="text-align: left;">
  <strong>Translation</strong>: "I want to learn a new language, but it's very challenging."<br /><br />
  <strong>Word</strong>: challenging (not difficult)<br /><br />
  <strong>Explanation</strong>: difficult in a way that tests your ability or determination<br /><br />
  <strong>Examples</strong>:<br />
  Learning a new language can be challenging at first.<br />
  The math problem was quite challenging for the students.<br />
  She found the job interview challenging but rewarding.
</div>
```

A canonical example in the repo to mirror in style and HTML: [vocab/turn-up.md](../../../vocab/turn-up.md).
