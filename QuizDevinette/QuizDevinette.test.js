const { expect } = require("chai");

describe("QuizDevinette", function () {
  let quiz, owner, joueur;

  beforeEach(async function () {
    [owner, joueur] = await ethers.getSigners();
    const Quiz = await ethers.getContractFactory("QuizDevinette");
    quiz = await Quiz.deploy();
    
  });

  it("doit permettre à l'owner de poser une devinette", async function () {
    await quiz.poserDevinette("Quel animal miaule ?", "chat");
    const question = await quiz.question();
    expect(question).to.equal("Quel animal miaule ?");
  });

  it("doit émettre un événement si la réponse est correcte", async function () {
    await quiz.poserDevinette("2+2 ?", "4");

    await expect(quiz.connect(joueur).deviner("4"))
      .to.emit(quiz, "ReponseTrouvee")
      .withArgs(joueur.address);
  });

  it("ne doit pas émettre d'événement si la réponse est fausse", async function () {
    await quiz.poserDevinette("Capital de la France ?", "Paris");

    await expect(quiz.connect(joueur).deviner("Lyon"))
      .to.not.emit(quiz, "ReponseTrouvee");
  });
});
