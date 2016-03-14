package controllers;

import models.Person;
import models.PersonRepository;
import play.data.Form;
import play.mvc.*;
import static play.libs.Json.toJson;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.inject.Singleton;


/**
 * The main set of web services.
 */
@Named
@Singleton
public class Application extends Controller {

    private final PersonRepository personRepository;

    // We are using constructor injection to receive a repository to support our desire for immutability.
    @Inject
    public Application(final PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public Result index() {
        return ok(views.html.index.render("Your new application is ready."));
    }
    
    public Result addPerson(){
    	Person person = Form.form(Person.class).bindFromRequest().get();
    	personRepository.save(person);
		return redirect(routes.Application.getPersons());
    }
    public Result getPersons(){
    	List<Person> persons = (List<Person>) personRepository.findAll();
    	return ok(toJson(persons));
    }
    
}
