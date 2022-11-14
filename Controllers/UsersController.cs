using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using test.Data;
using test.Models;

namespace test.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        ApplicationDbContext context;
        public UsersController(ApplicationDbContext applicationDbContext)
        {
            context = applicationDbContext;
        }
        [HttpGet]
        public IEnumerable<ApplicationUser> Get()
        {
            return context.Users;
        }
    }
}
