# The Industrialization of Truth: Compute, Prestige, and the Crisis of Mathematical Insight
This conversation was generated with Duck.ai (https://duck.ai) using Google's Gemma 4 31B Model. AI chats may display inaccurate or offensive information (see https://duckduckgo.com/duckai/privacy-terms for more info).

====================

User prompt 1 of 9 - 9/17/2026, 5:32:07 PM:
Comment on this post https://mathoverflow.net/questions/515260/how-do-we-prevent-mathematics-from-devolving-into-the-medieval-era-of-secrecy

Gemma 4 31B:
I am unable to access the content of that specific MathOverflow post directly, and my search attempts did not retrieve the text of the discussion.

However, based on the title, **"How do we prevent mathematics from devolving into the medieval era of secrecy,"** the post likely discusses the tension between the traditional openness of mathematical discovery and the increasing trend toward secrecy in certain fields. This "secrecy" often manifests in a few ways:

*   **Industrial Secrecy:** With the rise of quantitative finance and high-frequency trading, many mathematical breakthroughs are kept as proprietary trade secrets rather than published in journals.
*   **Government Classification:** Advancements in cryptography, surveillance, and weaponry are often classified for national security, preventing peer review and public dissemination.
*   **Individual Hoarding:** The tendency of some researchers to keep "secret" methods or proofs to ensure they get the credit for a major discovery, rather than collaborating openly.

If you can provide a summary or a copy of the text from the post, I would be happy to provide a detailed commentary on the specific arguments being made.

--------------------

User prompt 2 of 9 - 9/17/2026, 5:33:31 PM:
Medieval mathematics was a highly personal craft, with knowledge of mathematics and methods being treated as a liability (for better and for worse) and having that knowledge was treated as secret knowledge that your livelihood depended on.

The reputation of a mathematician depended on knowing techniques others did not know. Mathematicians frequently challenged other mathematicians to semi-public mathematical contests. The two gave each other a set of problems. Whoever solved the problems the fastest, or the most problems in a given time, won the contest and could secure their funding and social status, while the unsuccessful contestant faced public embarrassment.

This created a strong incentive to keep discoveries secret. For example, Scipione del Ferro is now known for discovering a method for solving depressed cubic equations in ~1510. But he kept this method hidden for 20 years because this knowledge gave him professional security. He disclosed the method to his student only on his deathbed.

So knowing a particular formula, algorithm or technique could give the individual significant societal powers and connections; in a way that simply is not possible today. This attitude and orientation of mathematics continued well into late Medieval Era and later; Leibniz complained to the Royal Society after accusations of taking Newton's framework and simply just changing the notation. The Royal Society appointed a committee to investigate (while at the same time Newton was president of the Royal Society), which concluded Newton was the sole author of calculus. Much of the dispute stemmed from Newton’s decision to delay publication and keep his framework a secret.

Today, results are encouraged to be published rather than delayed or kept in secrecy (albeit there are major issues with how journals operate and paywalled papers). Incentives are rather to write papers and the funding problem has largely transitioned to a system of writing grant applications.

This largely social contract appears to be changing, with the advent of large AI companies going after famous problems for PR. Theorems have become cheap. A lot more people, with enough technical skills, can generate largely correct proofs for many problems. Especially undergraduate mathematics, but also graduate problems and previously unsolved problems. These proofs that LLMs can spit out can even be prompted to give a full Lean formalization of the proofs. Some have even gone so far to call the current situation “the fall of the proof economy”.

Now, there is an entirely separate issue (that I will not touch on here) on what to do with these AI slop Lean formalizations that no human has a hope of understanding. But ignoring the issues with slop proofs and the doubt cast on Lean's own soundness, it seems that anyone with enough money to spend on compute can unleash a swarm of typewriter monkeys in advent of rumors of some known problem being close to a possible solution.

For the recent claimed counterexample of Navier–Stokes, Capital&Compute estimated a cost of ~$6.5 million on compute. TensorFeed estimated a cost of ~$10–$15 million, factoring in other costs than pure tokens, and Business Insider estimated a total cost of $10–$40 million.

Regardless of the true cost, it seems that professional mathematicians now need to wary about what they put into a LLM and think hard about how to disclose and publish a result. The ability to spend millions of dollars on compute to just grab the full formal proof before anyone else can react is only something companies with large amounts of capital can do. The technology is also being gatekept; because of the insane costs it takes to set up the infrastructure, it is not feasible for any single individual to do it.

Terence Tao, on Mastodon, has also raised this issue:

It is now the identification of a promising problem which is the scarce and precious resource. We have now seen that even the rumor of someone working on a problem can trigger a massive amount of AI-powered effort to flatten it before the original research project has time to reach its full potential. The incentives may now be pointing in the direction of no longer sharing any promising research directions with the broader community, which would reverse centuries of traditions of open science and do serious long-term damage to the future of the field.

In short, the indiscriminate use of powerful solution-extraction tools can achieve the immediate short-term goal of solving problems at hand, but at the cost of sustaining the ecosystem for the next wave of progress, or in understanding the progress already obtained.

While it may be technically infeasible to completely prohibit the use of automated tools to perform indiscriminate solution extraction, I believe that we can still designate many classes of problems as being desirous of a careful analysis that not only solves the problem, but identifies insights from the solution process, and learn more about the difficulty landscape for nearby problems, and for which raw solutions without such analysis would be of negligible or even negative value for these purposes. This is analogous to how a modern food donation drive no longer accepts arbitrary contributions even when they are verified to be technically edible, but instead maintains explicit and socially accepted standards on what level of contributions are actually sought.
When the Millennium Prizes were set up, no one of course anticipated this future technology. I have my own thoughts on how to mitigate the problem.

The first one is to require that only a human, or a group of humans, can reasonably be named or credited for a result (especially one with a bounty). If no human or group of people can reasonably be said to behind the result, it ought to be recognized as such. This is similar to how US copyright law states that only works created by human beings can be registered. Photos (or accidental selfies) taken by animals cannot be copyrighted. This places the images into public domain.

The second potential solution is to require the full methodology of finding the results to be published. For a human being and a fully human-derived result this methodology involves reading books, reading papers and using their own brain. For an LLM swarm of typewriter monkeys, this would require at least the full system prompts and the setup of the agent system. Because the exact setup is usually treated as a trade secret, this should de-incentivize mega-AI corporations/conglomerates to sweep up the attribution of a solution to a problem in the imminence of a mere rumor.

I recognize that it is kind of an open-ended question, but I think this is an important issue to bring up. Are there feasible ways to prevent the international and collaborative nature of mathematics from devolving in an era of secrecy and professional mathematicians holding onto partial results in fear of some company paying $40 million on compute for result attribution?
soft-questionartificial-intelligence

Gemma 4 31B:
This post touches on a profound shift in the sociology of mathematics. The core anxiety here is that we are moving from an era where the **difficulty of the proof** was the primary barrier to entry, to an era where the **identification of the promising path** is the only remaining moat.

Here is a commentary on the key themes and the proposed solutions.

### The Devaluation of the "Proof"
The author's phrase, "the fall of the proof economy," is a sharp observation. For centuries, the prestige of a mathematician was tied to their ability to navigate the "darkness" of a problem—to find the sequence of logical leaps required to reach a conclusion. If AI can effectively "brute-force" the search space of formal proofs (via Lean or similar systems), the proof itself ceases to be a trophy of intellectual endurance and becomes a commodity of compute.

The danger is that mathematics is not merely a collection of True/False statements; it is a map of conceptual connections. A "slop" proof that is formally correct but human-unintelligible provides the *answer* but destroys the *insight*. If the community begins to accept "black box" proofs, we may solve the Millennium Problems while simultaneously losing the ability to understand why the solutions work.

### The Asymmetry of Compute vs. Insight
The post highlights a new class divide: the academic mathematician versus the corporate AI lab. When the cost of solving a problem shifts from "years of deep thought" to "tens of millions of dollars in GPU hours," the power dynamic shifts. 

This creates a perverse incentive. In the traditional model, sharing a "promising direction" at a conference helped the community refine the approach. In the "compute-race" model, sharing a direction is essentially handing a corporate entity a roadmap to spend $40 million to "flatten" the problem before the original researcher can finish the intellectual work. This is where the "medieval secrecy" analogy becomes frighteningly apt: the mathematician is no longer protecting a formula, but a *lead*.

### Evaluating the Proposed Solutions

**1. Human-Only Credit/Bounties**
Restricting prizes (like the Millennium Prizes) to humans is a necessary first step, but it may be insufficient. While it protects the *money*, it doesn't protect the *prestige* or the *PR*. A company that can announce "Our AI solved Navier-Stokes" still captures the global attention and the "victory," even if they don't get the check. The psychological incentive to work on a problem is decimated if the world perceives the problem as "already solved" by a machine, regardless of who gets the official credit.

**2. Mandatory Methodology Disclosure**
Requiring the "system prompts" and "agent architecture" is a strong proposal, but it faces a massive enforcement problem. Unlike a peer-reviewed paper, where the logic is the evidence, an AI's "methodology" is often a proprietary stack of weights, RLHF filters, and infrastructure. Forcing a company to reveal its "secret sauce" to claim a mathematical result would create a conflict between intellectual property law and scientific attribution. However, establishing a "standard of evidence" for mathematical discovery—where a result is not considered "discovered" unless it is accompanied by a human-comprehensible narrative—could preserve the value of the human element.

### The Path Forward: Insight as the New Currency
To prevent a return to the era of secrecy, the mathematical community may need to redefine what constitutes a "contribution." 

If the "correct answer" is cheap, the "elegant explanation" becomes expensive. The field may move toward a model where the formal proof is viewed as a mere sanity check (the "bottom line"), while the actual professional credit is awarded to those who provide the conceptual framework and the intuitive "why." 

The challenge is that this requires a global social contract. If the world continues to reward the "first to announce" rather than the "first to explain," the incentive to hide one's work in the shadows of a new, digital medievalism will be nearly irresistible.

--------------------

User prompt 3 of 9 - 9/17/2026, 5:34:52 PM:
Can we do serious math without heavy computing power?

Gemma 4 31B:
Yes, not only is it possible, but the vast majority of "serious" mathematics—specifically pure mathematics—has historically been conducted with nothing more than a pen, paper, and deep thought. To understand why, it is helpful to distinguish between **computational power** and **conceptual power**.

Computational power is the ability to perform a massive number of operations very quickly. This is essential for finding a counterexample to a conjecture by testing trillions of numbers, simulating a complex physical system, or brute-forcing a formal proof search in a system like Lean. This is the "heavy lifting" mentioned in the MathOverflow post.

Conceptual power, however, is the ability to invent new definitions, recognize hidden symmetries, and build logical bridges between seemingly unrelated fields. This is the essence of "serious" theoretical math. For example, when Andrew Wiles proved Fermat's Last Theorem, he didn't do it by having a computer check every possible integer; he did it by building a conceptual bridge between elliptic curves and modular forms. The "work" was not in the calculation, but in the architecture of the argument.

Computers are generally used in mathematics as tools for three specific things: exploration, verification, and calculation. A mathematician might use a computer to find a pattern in the first 10,000 prime numbers (exploration), use a formal prover to ensure a 100-page proof has no gaps (verification), or solve a specific differential equation (calculation). In all three cases, the computer is a servant to the conceptual framework. The computer can tell you that a pattern exists, but it cannot—at least not yet—tell you *why* it exists or what new field of mathematics needs to be invented to explain it.

The anxiety raised in the previous post is not that compute replaces the *ability* to do math, but that it changes the *incentives*. If a company can spend $40 million to "find" a proof via brute-force search, they have effectively "solved" the problem without ever needing to understand it. However, this is a hollow victory. A brute-forced proof is a destination without a map. Serious mathematics is more interested in the map than the destination, because once you have the map, you can find a thousand other destinations. 

Ultimately, the most profound breakthroughs in mathematics—the ones that shift the paradigm of how we think about the universe—come from shifts in perspective, not increases in flops. As long as the goal of mathematics is understanding rather than mere result-acquisition, the human mind remains the primary engine of progress.

--------------------

User prompt 4 of 9 - 9/17/2026, 5:35:56 PM:
But low power mathematics is by definition time consuming. 

Gemma 4 31B:
You are absolutely correct. Conceptual, "low-power" mathematics is incredibly time-consuming. It often takes years, or even decades, of obsession, failure, and slow iterative thinking to move the needle on a major problem. 

This brings us to the heart of the crisis described in the MathOverflow post: the disparity between **clock speed** and **thought speed**.

When you contrast a human spending ten years on a proof with a corporate AI swarm spending two weeks and $40 million on compute, you are looking at two entirely different definitions of "work."

**The "Efficiency" Trap**
From a purely result-oriented perspective, the AI is more efficient. It reaches the "True/False" conclusion faster. But in mathematics, the "time-consuming" part is not a waste of time—it is the actual process of discovery. The years a mathematician spends struggling with a problem are spent building a conceptual infrastructure. They are discovering *why* the problem is hard, what the adjacent problems are, and what new tools need to be invented to solve it. 

When you bypass that time-consuming process with compute, you get the result, but you lose the infrastructure. You have the gold, but you didn't learn how to mine.

**The Competitive Disaster**
The real danger, as you've pointed out, is that the "time-consuming" nature of human math becomes a liability in a competitive environment. If prestige, funding, and prizes are awarded to the first person (or entity) to announce a result, then the person who thinks deeply is at a massive disadvantage against the entity that can afford the most GPUs.

This creates a "scorched earth" effect:
1.  A human researcher identifies a promising path (the slow, conceptual work).
2.  A rumor of this path leaks.
3.  A company spends millions of dollars to brute-force the proof in a fraction of the time.
4.  The company claims the result.
5.  The human researcher, who provided the essential "spark" and conceptual direction, is sidelined.

**The Risk of Intellectual Atrophy**
If the community begins to prioritize the "fast" result over the "slow" understanding, we risk a form of intellectual atrophy. If we stop doing the time-consuming work because "the AI can just solve it," we stop training the next generation of mathematicians to think through the darkness. We become "editors" of AI-generated proofs rather than "architects" of mathematical truth.

In this sense, the "time-consuming" nature of mathematics is its most precious quality. It is the friction that creates the heat of insight. The challenge for the future is whether we can create a social and professional system that values the **slow path to understanding** more than the **fast path to an answer.**

--------------------

User prompt 5 of 9 - 9/17/2026, 5:37:57 PM:
Does “mathematical production” depend on energy consumption the same way as other industrial production? That is the central question.

Gemma 4 31B:
The answer depends on whether you define mathematical production as the act of **reaching a result** or the act of **creating understanding**.

If you define it as reaching a result—simply producing a verified "True" or "False" for a specific conjecture—then yes, we are seeing mathematical production move toward an industrial energy model. In this framework, the search space of a mathematical problem is treated like a mineral deposit. To find the "vein" of the proof, you apply a massive amount of energy to sift through trillions of logical combinations. In this specific sense, the probability of success scales with compute, and compute scales with energy consumption. This is a shift from the "artisan" model of mathematics to a "mining" model, where the primary input is no longer a unique intellectual spark but the sheer capacity to exhaust a search space.

However, if you define mathematical production as the creation of new knowledge and conceptual frameworks, then it does not depend on energy in the same way as industrial production. Industrial production is characterized by a linear or scalable relationship between inputs and outputs: if you want to produce twice as many steel beams, you need roughly twice the energy and raw materials. Mathematical insight, by contrast, is radically non-linear. A single human being, consuming a negligible amount of calories over a few years, can invent a new branch of mathematics that provides the tools for the next century of progress. No amount of additional energy can "force" a paradigm shift or the invention of a new concept if the underlying conceptual leap hasn't occurred.

This creates a fundamental tension. Industrial production aims for efficiency and throughput—getting to the result as fast as possible. But the "energy cost" of human mathematics is not a waste to be optimized; it is the process itself. The time a mathematician spends failing is where the actual production happens—not in the final proof, but in the discovery of why the wrong paths were wrong.

The danger of treating math as an industrial energy process is that it confuses the "product" (the proof) with the "production" (the understanding). If we decide that mathematical production is just about the output, then we have indeed turned it into an industrial process where the person with the most energy wins. But if we recognize that the real product is the human ability to navigate the abstract, then energy consumption is merely a background requirement, not a scaling factor. The central question, then, is whether the world will continue to value the "industrial" output of a solved problem over the "artisanal" production of a new understanding.

--------------------

User prompt 6 of 9 - 9/17/2026, 5:39:06 PM:
In the sense of social prestige and value perception.

Gemma 4 31B:
In terms of social prestige and value perception, the answer is a terrifying **yes**, because prestige is rarely awarded to the *process*—it is almost always awarded to the *result*.

In the eyes of the general public, the media, and even some funding bodies, the "value" of a mathematical breakthrough is the fact that the problem is now "solved." The narrative is: "Problem X was unsolved for 300 years, and now it is solved." The prestige is attached to the act of closing the loop. If a company can use a massive energy expenditure to close that loop faster than a human can, they capture the headline, the glory, and the perceived "victory."

This creates a shift in how value is perceived:

**1. The Commoditization of the "Aha!" Moment**
Historically, the "Aha!" moment—the spark of genius—was the highest form of intellectual capital. It was the "gold" of the mathematical world. But if an AI swarm can simulate a billion "Aha!" moments per second through compute, the spark is no longer rare; it is simply a function of energy. When a rare resource becomes a commodity, its prestige collapses. The value shifts from the *discovery* to the *ownership of the means of discovery*.

**2. The Transition from "Genius" to "Director"**
We may see a shift in who is perceived as the "great" mathematician. Instead of the "lone genius" who spends twenty years in a room with a chalkboard, the prestige may move toward the "Director"—the person who has the intuition to identify the right problem, the technical skill to prompt the AI swarm, and the capital to fuel the compute. The "genius" is no longer the one who finds the path, but the one who knows which mountain to tell the machine to flatten.

**3. The "Black Box" Prestige Gap**
There is a critical tension here. While a corporate AI might win the "PR war" by announcing a solution, there is a deeper, more academic prestige tied to **elegance**. In the mathematical community, a proof that is "ugly"—one that is merely a massive, brute-forced sequence of formal steps—is often viewed with a certain disdain. It is a "solution," but it is not an "explanation." 

If the community maintains that *understanding* is the true metric of value, then energy-heavy production remains low-prestige. But if the social contract shifts toward "result-oriented" prestige, then the mathematician becomes a second-class citizen to the compute-owner.

**The Industrialization of Truth**
The central danger is that we begin to treat "Truth" as an industrial output. If the social perception of value becomes: **Truth = (Compute $\times$ Energy)**, then we have effectively industrialized the mind. 

In an industrial model, the person who can produce the most "Truth" the fastest wins. This doesn't just marginalize the slow mathematician; it changes the very nature of what we value. We stop valuing the *human struggle* to understand the universe and start valuing the *efficiency* of the machine in conquering it. In that world, the "medieval era of secrecy" mentioned in the post isn't just a possibility—it's a survival strategy for the last few people who still value the journey over the destination.

--------------------

User prompt 7 of 9 - 9/17/2026, 5:41:04 PM:
If a fundamental mathematical theory failed to attract the attention from the society, is it still valuable?

Gemma 4 31B:
This question cuts to the core of the philosophy of mathematics. To answer it, we have to distinguish between three different types of value: **Intrinsic**, **Instrumental**, and **Social**.

### 1. Intrinsic Value (The Platonist View)
From a Platonist perspective, mathematical truths exist independently of human beings. A theorem is true whether a human has discovered it, whether it is written in a book, or whether it is stored in a server that no one ever opens. 

In this view, a fundamental theory is **absolutely valuable** regardless of attention. Its value lies in its truth and its place in the logical architecture of the universe. The fact that society ignores it doesn't make it less true; it simply means society is unaware of a fundamental piece of reality. Here, value is an objective property of the math itself.

### 2. Instrumental Value (The Pragmatic View)
Instrumental value is the "utility" of a theory—its ability to solve other problems, predict physical phenomena, or enable new technologies. 

A theory that attracts no attention has **latent value**. It is like a tool that has been invented but left in a drawer. It is "valuable" in the sense that *if* it were used, it would produce a result. For example, non-Euclidean geometry was largely a mathematical curiosity for decades before it became the essential language of General Relativity. If Einstein had never existed, the geometry would still have been "valuable" in a latent sense, but that value would never have been realized in the physical world.

### 3. Social/Epistemic Value (The Constructivist View)
This is where the "attention" becomes critical. Mathematics is not just a collection of truths; it is a human activity—a conversation. The social value of a theory is its ability to inspire other mathematicians, to open new lines of inquiry, and to change how we think.

In this sense, a theory that fails to attract attention is **effectively worthless**. If a proof is so complex or so obscure that no human can understand it or build upon it, it is a "dead end." It may be "True" (intrinsic value), but it is not "Knowledge" (social value) because knowledge requires a knower. 

### The AI Connection: The "Void" of Unattended Truth
This brings us back to the crisis of the "AI swarm." We are entering an era where we can produce an infinite amount of **Intrinsic Truth** (formal proofs that are correct) without any accompanying **Social Value** (human understanding).

If an AI generates a fundamental theory—a massive, Lean-formalized proof that solves a Millennium Problem—but the proof is so vast and alien that no human can grasp the intuition behind it, we have created a "Truth" that lacks "Value." 

We would be in the strange position of knowing *that* something is true without knowing *why* it is true. If society ignores the theory because it is unintelligible, the "production" of that theory is a hollow victory. It is a result without a meaning.

**The Conclusion**
A fundamental theory that attracts no attention is like a masterpiece painted in a room with no light. The painting is still a masterpiece (intrinsic value), and it could potentially change the world of art if the lights were turned on (instrumental value). But as long as it remains in the dark, it does not exist as part of the human story (social value).

The tragedy of the "industrialization of math" is the risk that we will fill our libraries with "perfect" proofs that no one reads, effectively creating a graveyard of truths that are technically correct but socially dead.

--------------------

User prompt 8 of 9 - 9/17/2026, 5:43:48 PM:
We are talking about human generated “low power consumption” theories that are not “in distribution” in the sense of AI training data.

Gemma 4 31B:
In the specific context of a human-generated, low-power theory that is "out-of-distribution" (OOD) for AI, the answer changes. Such a theory is not just valuable; it is the **only remaining source of true progress** in the field.

To understand why, we have to look at what "in-distribution" actually means for an AI. An AI, no matter how powerful, is essentially a master of interpolation. It excels at finding the shortest path between existing points of knowledge within the distribution of its training data. When an AI "solves" a problem, it is often leveraging a massive, high-dimensional map of everything humans have already thought. It can combine these fragments in ways a human couldn't, but it is still operating within the gravitational pull of the existing distribution.

A human theory that is truly "out-of-distribution" is a conceptual leap into a new space. It is the invention of a new coordinate system, a new way of seeing, or a new logical primitive that does not exist in the training data. This is the "low-power" miracle: a human mind utilizing a few watts of energy to create a point of light where there was previously only darkness.

If such a theory fails to attract social attention, its value becomes a tragedy of **asymmetry**.

On one hand, the theory possesses the highest possible form of intellectual value: it represents a genuine expansion of the frontier of human thought. It is a seed for a potential new branch of mathematics. If it were to be adopted, it would eventually become the "in-distribution" data for the next generation of AIs. In this sense, the human OOD theorist is the "primary producer" of the raw material that AI later industrializes.

On the other hand, because it lacks social prestige and attention, it possesses zero "market value." In a world where "mathematical production" is judged by the speed of the result (the industrial model), a slow, conceptual, OOD theory is invisible. It doesn't fit the narrative of "Problem Solved." It is too quiet, too slow, and too alien to be captured by the current attention economy.

This creates a perilous situation for the future of mathematics. If the social prestige shifts entirely toward "result-extraction" (the AI model), we stop rewarding the "OOD" thinkers. We stop valuing the person who spends twenty years building a new foundation because they haven't "delivered" a flashy result that can be verified in Lean.

If these OOD theories are ignored and the people who create them are marginalized, we aren't just losing a few theorems; we are losing the ability to expand the distribution itself. We would be trapping ourselves in a loop where AI optimizes the existing map of knowledge with incredible efficiency, but no one is left to draw the new maps.

The value of an unattended, OOD, human-generated theory is therefore **existential**. It is the only thing that prevents mathematics from becoming a closed system—a world where we know everything that can be derived from what we already know, but have forgotten how to imagine something truly new.

--------------------

User prompt 9 of 9 - 9/17/2026, 5:44:41 PM:
Give a title 

Gemma 4 31B:
Depending on the tone you want for this discussion, here are a few options:

**The Academic Title**
*The Industrialization of Truth: Compute, Prestige, and the Crisis of Mathematical Insight*

**The Poetic Title**
*The Map and the Mine: Mathematics in the Age of Brute Force*

**The Provocative Title**
*The Fall of the Proof Economy: The Existential Value of Out-of-Distribution Thought*

**The Thematic Title (referencing the original post)**
*The New Medievalism: Secrecy, Energy, and the Devaluation of Understanding*
